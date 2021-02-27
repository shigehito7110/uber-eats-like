import React from 'react';

import { Dialog, DialogTitle, DialogContent } from '@material-ui/core';
import { OrderButton } from './Buttons/OrderButton';

export const NewOrderConfirmDialog = ({
  isOpen,
  onClose,
  existingRestaurantName,
  newRestaurantName,
  onClickSubmit
}) => (
  <Dialog
    open={isOpen}
    onClose={onClose}
    maxWitdh="xs">
    <DialogTitle>
      新規注文を開始しますか？
      </DialogTitle>
    <DialogContent>
      <p>
        {
          `ご注文に${existingRestaurantName}の商品が含まれています。
            新規の注文を開始して${newRestaurantName}の商品を注文してください。`
        }
      </p>
      <OrderButton onClick={onClickSubmit}>
        新規注文
      </OrderButton>
    </DialogContent>
  </Dialog>
)
