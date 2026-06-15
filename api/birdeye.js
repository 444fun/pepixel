export default async function handler(req, res) {
  const address = req.query.address || req.url?.split("?address=")[1] || "";
  if (!address) {
    res.status(400).json({ error: "missing_address" });
    return;
  }

  const beUrl = `https://birdeye.so/token/${address}?chain=solana`;
  try {
    const r = await fetch(beUrl);
    const html = await r.text();
    let m = html.match(/"price"\s*[:=]\s*"?([0-9]+(?:\.[0-9]+)?)"?/i);
    if (!m) m = html.match(/\$\s*([0-9]+(?:\.[0-9]+)?)/);
    if (m) {
      const price = Number(m[1]);
      res.setHeader("Access-Control-Allow-Origin", "*");
      res.json({ source: "birdeye", price });
      return;
    }
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.status(404).json({ error: "price_not_found" });
  } catch (err) {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.status(502).json({ error: "fetch_failed", detail: String(err) });
  }
}
