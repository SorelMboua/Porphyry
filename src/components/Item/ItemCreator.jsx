import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import Hypertopic from 'hypertopic';

const _log = (x) => console.log(JSON.stringify(x, null, 2));
const _error = (x) => console.error(x.message);

class ItemCreator extends Component {

  render() {
    return (
      <button className="btn btn-light creationItemButton" id={this.props.corpus} onClick={_ => this._newItem()}>
        +
      </button>
    );
  }

  async _newItem() {
    let db = new Hypertopic((await this.props.conf).services);
    db.post({item_corpus: this.props.corpus})
    .then((data) => {
      _log(data);
      this._goToNewItem(data);
    })
    .catch(_error);
  }

  _goToNewItem(data) {
    this.props.history.push(`/item/${data.item_corpus}/${data._id}`);
  }
}

export default withRouter(ItemCreator);
