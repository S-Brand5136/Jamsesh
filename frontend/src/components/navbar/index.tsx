import { useState } from 'react';
import {
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  createStyles,
  Theme,
  makeStyles,
  Hidden,
} from '@material-ui/core';
import { Menu } from '@material-ui/icons';

import MenuNav from './MenuNav';

const drawerWidth = '100%';

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    drawer: {
      [theme.breakpoints.up('sm')]: {
        width: drawerWidth,
        flexShrink: 0,
      },
    },
    appBar: {
      [theme.breakpoints.up('sm')]: {
        width: `calc(100% - 240px)`,
        marginLeft: 240,
      },
    },
    menuButton: {
      [theme.breakpoints.up('sm')]: {
        display: 'none',
      },
    },
    toolbar: theme.mixins.toolbar,
    drawerPaper: {
      width: drawerWidth,
      [theme.breakpoints.up('sm')]: {
        width: 240,
      },
    },
  })
);

const Header: React.FC = () => {
  const [mobileOpen, setMobileOpen] = useState(false);
  const classes = useStyles();

  const handleDrawerToggle = () => {
    setMobileOpen((state) => !state);
  };

  return (
    <>
      <AppBar position='fixed' className={`root ${classes.appBar}`}>
        <Toolbar>
          <IconButton
            className={`menu-button ${classes.menuButton}`}
            edge='start'
            color='inherit'
            aria-label='open menu'
            onClick={handleDrawerToggle}
          >
            <Menu />
          </IconButton>
          <Typography variant='h6' className='title'>
            JamSesh
          </Typography>
        </Toolbar>
      </AppBar>
      <nav className={classes.drawer}>
        <Hidden smUp>
          <MenuNav
            isOpen={mobileOpen}
            classes={classes.drawerPaper}
            onClose={() => handleDrawerToggle()}
            ModalProps={{ keepMounted: true }}
            variant='temporary'
            Toolbar={classes.toolbar}
          />
        </Hidden>
        <Hidden xsDown>
          <MenuNav
            isOpen={true}
            classes={classes.drawerPaper}
            variant='permanent'
            Toolbar={classes.toolbar}
          />
        </Hidden>
      </nav>
    </>
  );
};

export default Header;
