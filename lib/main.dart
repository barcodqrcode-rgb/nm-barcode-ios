import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const NMBarcodeApp());
}

class NMBarcodeApp extends StatelessWidget {
  const NMBarcodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NM Barcode Generator',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  String qrData = '';

  void generateQR() {
    setState(() {
      qrData = controller.text.trim();
    });
  }

  void clearQR() {
    controller.clear();

    setState(() {
      qrData = '';
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NM Barcode Generator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              const Icon(
                Icons.qr_code_2,
                size: 80,
              ),

              const SizedBox(height: 12),

              const Text(
                'QR Code Generator',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Въведи текст или линк',
                  hintText: 'https://example.com',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.link),
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton.icon(
                onPressed: generateQR,
                icon: const Icon(Icons.qr_code),
                label: const Text('Създай QR код'),
              ),

              const SizedBox(height: 10),

              OutlinedButton.icon(
                onPressed: clearQR,
                icon: const Icon(Icons.clear),
                label: const Text('Изчисти'),
              ),

              const SizedBox(height: 30),

              if (qrData.isNotEmpty)
                Center(
                  child: QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 250,
                    backgroundColor: Colors.white,
                  ),
                ),

              if (qrData.isNotEmpty)
                const SizedBox(height: 20),

              if (qrData.isNotEmpty)
                Text(
                  qrData,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}