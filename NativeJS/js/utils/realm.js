// 数据库表结构

import Realm from 'realm';

class User extends Realm.Object {}

User.schema = {
  name: 'User',
  primaryKey: 'id',
  properties: {
    id: 'string',
    name: {type: 'string', optional: true, default: ""},
    token: {type: 'string', optional: true, default: ""},
  }
}

export default new Realm({schema: [User], schemaVersion: 1});
