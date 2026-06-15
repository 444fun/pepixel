import os, re, sys

root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
html_files = []
for dirpath, dirs, files in os.walk(root):
    # skip node_modules and hidden folders
    if 'node_modules' in dirpath.split(os.sep):
        continue
    for f in files:
        if f.lower().endswith('.html'):
            html_files.append(os.path.join(dirpath, f))

pattern = re.compile(r'(?:href|src)=["\']([^"\']+)["\']', re.IGNORECASE)
ignore_prefixes = ('http://','https://','//','mailto:','tel:','#','data:')

missing = []

for hf in sorted(html_files):
    rel_hf = os.path.relpath(hf, root)
    try:
        with open(hf, 'r', encoding='utf-8', errors='ignore') as fh:
            text = fh.read()
    except Exception as e:
        print('ERROR reading', rel_hf, e)
        continue
    for m in pattern.findall(text):
        target = m.split('?')[0].split('#')[0]
        if not target or target.startswith(ignore_prefixes):
            continue
        # ignore template placeholders like ${meme.src}
        if '${' in target or '}' in target:
            continue
        if target.startswith('/'):
            tgt_path = os.path.join(root, target.lstrip('/'))
        else:
            tgt_path = os.path.normpath(os.path.join(os.path.dirname(hf), target))
        if not os.path.exists(tgt_path):
            missing.append((rel_hf, m, os.path.relpath(tgt_path, root)))

if not missing:
    print('OK: no missing local links found')
    sys.exit(0)
else:
    print('MISSING LINKS:')
    for hf, ref, tgt in missing:
        print(f'{hf} -> {ref}  -> {tgt}')
    sys.exit(2)
