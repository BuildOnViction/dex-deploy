const { providers, Contract } = require('ethers')
const { ERC20 } = require('../utils/abis')

const queryTokenBalances = async () => {
  try {
    let provider = new providers.JsonRpcProvider('http://localhost:8501')
    let accountAddress = '0xB5CBBF80ee36655c4cAF76FA30FbdDb31068035A'
    const token = new Contract(
      '0x00059F033E01E1b9adA01AB3931BF71D7Ba6330C',
      ERC20,
      provider
    )
    const balance = await token.balanceOf(accountAddress)
    console.log(`${balance}`)
  } catch (err) {
    console.log(err)
  }
}

queryTokenBalances()
