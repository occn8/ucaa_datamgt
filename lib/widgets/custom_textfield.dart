import 'package:ucaa_datamgt/index.dart';

buildTextFormField(BuildContext context, TextEditingController control,
    String label, String hint,
    {TextInputType type = TextInputType.text, int mxl = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
    child: TextFormField(
      controller: control,
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.green)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(15),
        labelText: label,
        labelStyle:
            TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      keyboardType: type,
      maxLines: mxl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    ),
  );
}

buildTextFormField2(BuildContext context, TextEditingController control,
    String label, String hint,
    {TextInputType type = TextInputType.number, int mxl = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
    child: TextFormField(
      controller: control,
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.green)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(15),
        labelText: label,
        labelStyle:
            TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      keyboardType: type,
      maxLines: mxl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    ),
  );
}
