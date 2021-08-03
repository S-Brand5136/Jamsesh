import { useHistory } from 'react-router-dom';

import { List, ListItem, ListItemIcon, ListItemText } from '@material-ui/core';
import { Person, PersonAdd } from '@material-ui/icons';

interface Props {
  onClose: () => void;
}

const VisitorMenu: React.FC<Props> = ({ onClose }) => {
  const history = useHistory();

  const clickHandler = (page: string) => {
    history.push(page);
    onClose();
  };

  return (
    <List>
      <ListItem button onClick={() => clickHandler('/login')}>
        <ListItemIcon>
          <Person />
        </ListItemIcon>
        <ListItemText primary='Login' />
      </ListItem>
      <ListItem button onClick={() => clickHandler('/register')}>
        <ListItemIcon>
          <PersonAdd />
        </ListItemIcon>
        <ListItemText primary='Register' />
      </ListItem>
    </List>
  );
};

export default VisitorMenu;
