import 'package:flutter/material.dart';

part 'countries.dart';
part 'phone_number.dart';

class ICountryCodePicker extends StatefulWidget {
  final ValueChanged<PhoneNumber>? onCountryChanged;
  final ValueChanged<PhoneNumber>? onCountryInit;
  final bool enabled;
  final String? initialValue;
  final String? initialCountryCode;
  final List<String>? countries;
  final InputDecoration? searchDecoration;
  final bool showDropdownIcon;
  final BoxDecoration dropdownDecoration;
  final String searchText;
  final Color? countryCodeTextColor;
  final IconPosition iconPosition;
  final Icon dropDownIcon;
  final bool autofocus;
  final bool showCountryFlag;
  final Color? dialogueBackgroundColor;
  final double dialogueRadius;
  final Iterable<String>? autoFillHints;

  const ICountryCodePicker({
    Key? key,
    this.initialCountryCode,
    this.onCountryInit,
    this.initialValue,
    this.searchDecoration,
    this.countries,
    this.onCountryChanged,
    this.showDropdownIcon = true,
    this.dropdownDecoration = const BoxDecoration(),
    this.enabled = true,
    this.searchText = 'Search by Country Name',
    this.countryCodeTextColor,
    this.iconPosition = IconPosition.leading,
    this.dropDownIcon = const Icon(Icons.arrow_drop_down),
    this.autofocus = false,
    this.showCountryFlag = true,
    this.dialogueBackgroundColor,
    this.dialogueRadius = 0,
    this.autoFillHints,
  }) : super(key: key);

  @override
  _ICountryCodePickerState createState() => _ICountryCodePickerState();
}

class _ICountryCodePickerState extends State<ICountryCodePicker> {
  late List<Country> _countryList;
  late Country _selectedCountry;
  late List<Country> filteredCountries;

  FormFieldValidator<String>? validator;

  @override
  void initState() {
    super.initState();
    _countryList = (widget.countries == null
        ? countries
        : countries
            .where((country) => widget.countries!.contains(country.dialCode))
            .toList());
    filteredCountries = _countryList;
    _selectedCountry = _countryList.firstWhere(
      (item) => item.code == (widget.initialCountryCode ?? 'US'),
      orElse: () => _countryList.first,
    );

    widget.onCountryInit!(
      PhoneNumber(
        countryISOCode: _selectedCountry.code,
        countryCode: '+${_selectedCountry.dialCode}',
        number: '',
      ),
    );
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => Dialog(
          child: Container(
            decoration: BoxDecoration(
              color: widget.dialogueBackgroundColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.dialogueRadius)),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: widget.searchDecoration ??
                      InputDecoration(
                        suffixIcon: const Icon(Icons.search),
                        hintText: widget.searchText,
                      ),
                  onChanged: (value) {
                    filteredCountries = _countryList
                        .where(
                          (country) => country.name.toLowerCase().contains(
                                value.toLowerCase(),
                              ),
                        )
                        .toList();
                    if (mounted) setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredCountries.length,
                    itemBuilder: (ctx, index) => Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset(
                            'assets/flags/${filteredCountries[index].code.toLowerCase()}.png',
                            package: 'intl_phone_number_picker',
                            width: 32,
                          ),
                          title: Text(
                            filteredCountries[index].name,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          trailing: Text(
                            '+${filteredCountries[index].dialCode}',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          onTap: () {
                            _selectedCountry = filteredCountries[index];

                            if (widget.onCountryChanged != null) {
                              widget.onCountryChanged!(
                                PhoneNumber(
                                  countryISOCode: _selectedCountry.code,
                                  countryCode: '+${_selectedCountry.dialCode}',
                                  number: '',
                                ),
                              );
                            }

                            Navigator.of(context).pop();
                          },
                        ),
                        const Divider(thickness: 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: widget.dropdownDecoration,
      child: InkWell(
        borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius?,
        onTap: widget.enabled ? _changeCountry : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.enabled &&
                  widget.showDropdownIcon &&
                  widget.iconPosition == IconPosition.leading) ...[
                widget.dropDownIcon,
                const SizedBox(width: 4)
              ],
              if (widget.showCountryFlag) ...[
                Image.asset(
                  'assets/flags/${_selectedCountry.code.toLowerCase()}.png',
                  package: 'intl_phone_number_picker',
                  width: 32,
                ),
                const SizedBox(width: 8)
              ],
              FittedBox(
                child: Text(
                  '+${_selectedCountry.dialCode}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: widget.countryCodeTextColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (widget.enabled &&
                  widget.showDropdownIcon &&
                  widget.iconPosition == IconPosition.trailing) ...[
                widget.dropDownIcon,
                const SizedBox(width: 4)
              ],
            ],
          ),
        ),
      ),
    );
  }
}

enum IconPosition {
  leading,
  trailing,
}
