import { useHistory } from 'react-router-dom';

import { List, ListItem, ListItemIcon, ListItemText } from '@material-ui/core';
import { Person, PersonAdd } from '@material-ui/icons';

const VisitorMenu: React.FC = () => {
  const history = useHistory();

  return (
    <List>
      <ListItem button onClick={() => history.push('/login')}>
        <ListItemIcon>
          <Person />
        </ListItemIcon>
        <ListItemText primary='Login' />
      </ListItem>
      <ListItem button onClick={() => history.push('/register')}>
        <ListItemIcon>
          <PersonAdd />
        </ListItemIcon>
        <ListItemText primary='Register' />
      </ListItem>
    </List>
  );
};

export default VisitorMenu;
