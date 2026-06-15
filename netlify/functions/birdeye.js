exports.handler = async function (event, context) {
  const qs = event.queryStringParameters || {};
  const address = qs.address || "";
  if (!address) {
    return {
      statusCode: 400,
      body: JSON.stringify({ error: "missing_address" }),
      headers: { "Access-Control-Allow-Origin": "*" },
    };
  }

  const beUrl = `https://birdeye.so/token/${address}?chain=solana`;
  try {
    const r = await fetch(beUrl);
    const html = await r.text();
    let m = html.match(/"price"\s*[:=]\s*"?([0-9]+(?:\.[0-9]+)?)"?/i);
    if (!m) m = html.match(/\$\s*([0-9]+(?:\.[0-9]+)?)/);
    if (m) {
      const price = Number(m[1]);
      return {
        statusCode: 200,
        body: JSON.stringify({ source: "birdeye", price }),
        headers: { "Access-Control-Allow-Origin": "*" },
      };
    }
    return {
      statusCode: 404,
      body: JSON.stringify({ error: "price_not_found" }),
      headers: { "Access-Control-Allow-Origin": "*" },
    };
  } catch (err) {
    return {
      statusCode: 502,
      body: JSON.stringify({ error: "fetch_failed", detail: String(err) }),
      headers: { "Access-Control-Allow-Origin": "*" },
    };
  }
};
