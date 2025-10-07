import 'package:flutter/material.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String prefix)? onPrefixChanged;
  final String? Function(String?)? validator;
  final String? hintText;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.onPrefixChanged,
    this.validator,
    this.hintText,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  String selectedFlag = '🇪🇬';
  String selectedPrefix = '+20';

  final List<Map<String, String>> countries = [
    {'flag': '🇪🇬', 'code': '+20'},
    {'flag': '🇸🇦', 'code': '+966'},
    {'flag': '🇦🇪', 'code': '+971'},
  ];

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: countries.length,
            separatorBuilder: (_, __) => const Divider(color: Colors.white24),
            itemBuilder: (context, index) {
              final country = countries[index];
              return ListTile(
                leading: Text(
                  country['flag']!,
                  style: const TextStyle(fontSize: 24),
                ),
                title: Text(
                  country['code']!,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                onTap: () {
                  setState(() {
                    selectedFlag = country['flag']!;
                    selectedPrefix = country['code']!;
                  });
                  widget.onPrefixChanged?.call(selectedPrefix);
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 📍 Country picker
        GestureDetector(
          onTap: _showCountryPicker,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade700),
            ),
            child: Row(
              children: [
                Text(selectedFlag, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 6),
                Text(
                  selectedPrefix,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        // 📞 Phone input
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: widget.hintText ?? '0109*******',
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: Colors.grey[900],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.tealAccent),
              ),
            ),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
