
import 'package:flutter/material.dart';
import '../lib/widgets/actions/bla_button.dart';

class TestButtonScreen extends StatelessWidget {
  const TestButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlaButton Test Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Test 1: Primary button
            const Text('1. Primary Button:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlaButton(
              label: 'Search Rides',
              onPressed: () => print('Primary button pressed!'),
              variant: ButtonVariant.primary,
            ),
            const SizedBox(height: 30),
            
            // Test 2: Primary with icon
            const Text('2. Primary with Icon:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlaButton(
              label: 'Contact Driver',
              onPressed: () => print('Button with icon pressed!'),
              variant: ButtonVariant.primary,
              icon: Icons.message,
            ),
            const SizedBox(height: 30),
            
            // Test 3: Secondary button
            const Text('3. Secondary Button:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlaButton(
              label: 'Cancel',
              onPressed: () => print('Secondary button pressed!'),
              variant: ButtonVariant.secondary,
            ),
            const SizedBox(height: 30),
            
            // Test 4: Disabled primary
            const Text('4. Disabled Primary:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlaButton(
              label: 'Search (Disabled)',
              onPressed: null,
              variant: ButtonVariant.primary,
              isEnabled: false,
            ),
            const SizedBox(height: 30),
            
            // Test 5: Disabled secondary
            const Text('5. Disabled Secondary:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlaButton(
              label: 'Cancel (Disabled)',
              onPressed: null,
              variant: ButtonVariant.secondary,
              isEnabled: false,
            ),
            const SizedBox(height: 30),
            
            // Test 6: Different widths
            const Text('6. Different Widths:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                BlaButton(
                  label: 'Small',
                  onPressed: () => print('Small button'),
                  variant: ButtonVariant.primary,
                  width: 120,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: BlaButton(
                    label: 'Full Width',
                    onPressed: () => print('Full width button'),
                    variant: ButtonVariant.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
