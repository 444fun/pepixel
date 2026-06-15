import os
root = r"d:/pepixel"
for dirpath, dirs, files in os.walk(root):
    for f in files:
        if not f.lower().endswith('.html'):
            continue
        path = os.path.join(dirpath, f)
        with open(path, 'r', encoding='utf-8', errors='ignore') as fh:
            lines = fh.readlines()
        for i, line in enumerate(lines):
            if 'fonts.googleapis.com/css2' in line:
                prev_line = lines[i-1].rstrip() if i>0 else ''
                next_line = lines[i+1].rstrip() if i+1<len(lines) else ''
                print('FILE:', os.path.relpath(path, root))
                print('PREV:', prev_line)
                print('LINE:', line.rstrip())
                print('NEXT:', next_line)
                print('---')
