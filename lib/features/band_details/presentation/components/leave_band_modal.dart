import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/core/domain/entities/musician.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';

class LeaveBandModalResult {
  final String? newFounderId;
  final bool leaveBand;

  LeaveBandModalResult({
    required this.newFounderId,
  }) : leaveBand = true;
}

class LeaveBandModal extends StatefulWidget {
  const LeaveBandModal({
    required this.musicians,
    required this.bandId,
    required this.roleId,
    super.key,
  });

  final List<Musician> musicians;
  final String bandId;
  final String roleId;

  @override
  State<LeaveBandModal> createState() => _LeaveBandModalState();
}

class _LeaveBandModalState extends State<LeaveBandModal> {
  String? selectedMusicianId;
  late final List<Musician> items;

  @override
  void initState() {
    items = widget.musicians
        .where(
          (musician) => musician.id != context.read<AuthCubit>().user.id,
        )
        .toList();

    if (items.isNotEmpty) selectedMusicianId = items.first.id;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Are you sure you want to leave this band?'),
          ),
          if (widget.roleId == 'founder')
            PickNewFounderDropdown(
              musicians: items,
              selectedMusicianId: selectedMusicianId,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedMusicianId = value;
                  });
                }
              },
            ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(
                  LeaveBandModalResult(newFounderId: selectedMusicianId),
                ),
                child: const Text('Leave'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PickNewFounderDropdown extends StatelessWidget {
  const PickNewFounderDropdown({
    super.key,
    required this.musicians,
    required this.onChanged,
    required this.selectedMusicianId,
  });

  final List<Musician> musicians;
  final String? selectedMusicianId;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    if (musicians.isEmpty) {
      return Text('The band will be deleted if you leave');
    }

    if (musicians.length == 1) {
      return Text('${musicians.first.name} will be the new founder');
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Select new founder:'),
        const SizedBox(width: 4),
        DropdownButton(
          value: selectedMusicianId,
          items: musicians
              .map(
                (musician) => DropdownMenuItem(
                  child: Text(musician.name),
                  value: musician.id,
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
