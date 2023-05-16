import 'package:flutter/material.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../models/payment_type_model.dart';
import '../payment_type_controller.dart';

class PaymentTypeItem extends StatelessWidget {
  final PaymentTypeController controller;
  final PaymentTypeModel payment;
  
  const PaymentTypeItem({super.key, required this.payment, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colorAll = payment.enabled ? Colors.black : Colors.grey; 

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image.asset('assets/images/icons/payment_${payment.acronym}_icon.png',
              errorBuilder: (context, error, stackTrace){
                return Image.asset('assets/images/icons/payment_notfound_icon.png',
                  width: context.percentWidth(.06),
                  color: colorAll,
                );
              },
              width: context.percentWidth(.06),
              color: colorAll,
            ),
            const SizedBox(
              width: 20,
            ),
              Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      'Forma de Pagamento',
                      style: context.textStyles.textRegular.copyWith(
                        color: colorAll,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    child: Text(
                      payment.name,
                      style: context.textStyles.textTitle.copyWith(
                        fontSize: 16,
                        color: colorAll,
                      ),
                    ),
                  ),
                ],
              ),),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    controller.editPayment(payment);
                  },
                  child: FittedBox(
                    child: Text('Editar', style: 
                      context.textStyles.textMedium.copyWith(
                        color: payment.enabled 
                          ? context.colors.primary 
                          : Colors.grey,
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
