import 'package:flutter/material.dart';

class CounterFuntionsScreen extends StatefulWidget 
{
  const CounterFuntionsScreen({super.key});

  @override
  State<CounterFuntionsScreen> createState() => _CounterFuntionsScreenState();
}

class _CounterFuntionsScreenState extends State<CounterFuntionsScreen> 
{
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions:[
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: (){
              setState(() {
                clickCounter = 0;
              });
            }
          ),
        ],
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
            //Text(clickCounter == 1 ? 'Click' : 'Clicks', style: const TextStyle(fontSize: 25  ))
            Text('Click${clickCounter ==  1 ? '' : 's'}', style: const TextStyle(fontSize: 25  ))
          ],
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_outlined,
            onPressed: (){
              clickCounter = 0;
              setState(() {});
            },
            ),
          
          const SizedBox(height: 10),
          
          CustomButton(
            icon: Icons.plus_one,
            onPressed: (){
              clickCounter++;
              setState(() {});
            },
            ),

          const SizedBox(height: 10),

          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: (){
              if(clickCounter == 0) return;
              clickCounter--;
              setState(() {});
            },
            ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget 
{
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) 
  {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      backgroundColor: Colors.blue,
      shape: const StadiumBorder(),
      onPressed: onPressed, 
      child: Icon(icon),
    );
  }
}