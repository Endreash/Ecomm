import 'package:flutter/material.dart';

/// Item quantity selector with +/- buttons and a text value in the middle
class ItemQuantitySelector extends StatelessWidget {
  const ItemQuantitySelector({
    super.key,
    required this.quantity,
    this.maxQuantity = 10,
    this.itemIndex,
    this.onChanged,
  });
  final int quantity;
  final int maxQuantity;
  final int? itemIndex;
  final ValueChanged<int>? onChanged;

  // * Keys for testing using find.byKey()
  static Key decrementKey([int? index]) =>
      index != null ? Key('decrement-$index') : const Key('decrement');
  static Key quantityKey([int? index]) =>
      index != null ? Key('quantity-$index') : const Key('quantity');
  static Key incrementKey([int? index]) =>
      index != null ? Key('increment-$index') : const Key('increment');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: IconButton(
            key: decrementKey(itemIndex),
            icon: const Icon(Icons.remove),
            onPressed: onChanged != null && quantity > 1
                ? () => onChanged!.call(quantity - 1)
                : null,
          ),
        ),
        
        SizedBox(
          width: 30.0,
          child: Text(
            '$quantity',
            key: quantityKey(itemIndex),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
          child: IconButton(
            key: incrementKey(itemIndex),
            icon: const Icon(Icons.add),
            onPressed: onChanged != null && quantity < maxQuantity
                ? () => onChanged!.call(quantity + 1)
                : null,
          ),
        ),
      ],
    );
  }
}