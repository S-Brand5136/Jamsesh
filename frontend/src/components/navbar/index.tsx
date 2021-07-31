import { AppBar, Toolbar, Typography, Button, IconButton } from '@material-ui/core'
import { Menu } from '@material-ui/icons'

const Header = () => {
  return (
      <AppBar position='static' className='root'>
        <Toolbar>
          <IconButton className='menu-button' edge='start' color='inherit' aria-label='menu'>
            <Menu />
          </IconButton>
          <Typography variant='h6' className='title'>
            JamSesh
          </Typography>
          <Button color='inherit'>Login</Button>
        </Toolbar>
      </AppBar>
  )
}

export default Header
