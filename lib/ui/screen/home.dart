import 'package:clyde/ui/component.dart';
import 'package:clyde/ui/screen/detail_wallet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailWalletScreen(),
                    ),
                  );
                },
                child: _cardWalletBalance(
                    total: '\$39.389',
                    totalCrypto: '7.2521322 BTC',
                    percent: 2.999),
              ),
              _cardWalletBalance(
                  total: '\$9.389',
                  totalCrypto: '7.2521322 ETH',
                  percent: -7.9999),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sorted by Higher %',
                style: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text(
                    '24H',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _listCryptoItem(
                    iconUrl:
                        'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Bitcoin-icon.png',
                    myCrypto: '3.52893030 BTC',
                    myProfit: '\$19.153',
                    myBalance: '\$5.441',
                    percent: 4.32),
                _listCryptoItem(
                  iconUrl:
                      'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Ethereum-icon.png',
                  myCrypto: '12.83789 ETH',
                  myBalance: '\$ 401',
                  myProfit: '\$4.822',
                  percent: 3.97,
                ),
                _listCryptoItem(
                  iconUrl:
                      'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Ripple-icon.png',
                  myCrypto: '1911.6374736 XRP',
                  myBalance: '\$ 0.45',
                  myProfit: '\$859',
                  percent: -13.55,
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  Widget _listCryptoItem(
      {required String iconUrl,
      required double percent,
      required String myCrypto,
      myBalance,
      myProfit}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            iconUrl,
            width: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myCrypto,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  myProfit,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                myBalance,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                percent >= 0 ? '+$percent%' : '$percent%',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: percent >= 0 ? Colors.green : Colors.pink),
              )
            ],
          )
        ],
      )),
    );
  }

  Widget _cardWalletBalance(
      {required String total, totalCrypto, required double percent}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: card(
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ClipOval(
                  child: Material(
                    color: Colors.black87,
                    child: InkWell(
                      splashColor: Colors.black,
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Text(
                    'Total Wallet Balance',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: const [
                    Text('USD'),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  total,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                      color: percent >= 0 ? Colors.green : Colors.pink,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    percent >= 0 ? '+$percent%' : '$percent%',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(totalCrypto,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black45)),
            const Center(
                child: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Colors.black45,
            ))
          ],
        ),
      ),
    );
  }
}
