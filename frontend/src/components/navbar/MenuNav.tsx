import { Button, Drawer, Divider, Typography, Hidden } from '@material-ui/core';
import {} from '@material-ui/icons';

import Login from './Login';
import Register from './Register';

interface Props {
  isOpen: boolean;
  classes: any;
  variant: any;
  onClose?: () => void;
  ModalProps?: any;
  Toolbar?: any;
}

const MenuNav: React.FC<Props> = ({
  isOpen,
  classes,
  onClose,
  ModalProps,
  variant,
  Toolbar,
}) => {
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
          <Typography variant='h6' className='drawer-title'>
            JamSesh
          </Typography>
        </Hidden>
      </div>
      <Divider />
      <Button color='inherit'>Login</Button>
      <Button color='inherit'>Sign Up</Button>
    </Drawer>
  );
};

export default MenuNav;
