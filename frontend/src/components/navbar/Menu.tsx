import { useState } from 'react';
import { Button, Drawer, Divider, Typography, Hidden } from '@material-ui/core';
import { Close, Person, PersonAdd } from '@material-ui/icons';

import VisitorMenu from './VisitorMenu';
import UserMenu from './UserMenu';

interface Props {
  isOpen: boolean;
  classes: any;
  variant: any;
  onClose?: () => void;
  ModalProps?: any;
  Toolbar?: any;
}

const SET_DEFAULT = 'SET__DEFAILT';
const SET_USER = 'SET_USER';

const Menu: React.FC<Props> = ({
  isOpen,
  classes,
  onClose,
  ModalProps,
  variant,
  Toolbar,
}) => {
  const [view, setView] = useState(SET_DEFAULT);

  return (
    <Drawer
      classes={{
        paper: classes,
      }}
      anchor='left'
      open={isOpen}
      onClose={onClose}
      ModalProps={ModalProps}
      variant={variant}
    >
      <div className={Toolbar}>
        <Hidden smUp>
          <div className='drawer-title'>
            <Typography variant='h6'>JamSesh</Typography>
            <Button onClick={() => onClose && onClose()}>
              <Close />
            </Button>
          </div>
        </Hidden>
      </div>
      <Divider />
      {view === SET_DEFAULT && <VisitorMenu />}
      {view === SET_USER && <UserMenu />}
    </Drawer>
  );
};

export default Menu;
