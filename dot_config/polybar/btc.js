const currArr = ["bitcoin"];

const fetchPrice = async (curr) => {
  const response = await fetch(
    `https://api.coingecko.com/api/v3/coins/${curr}`
  );
  const data = await response.json();
  console.log(`BTC $${Math.floor(data.market_data.current_price.usd)}`);
};

fetchPrice("bitcoin");
