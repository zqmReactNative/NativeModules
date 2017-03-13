// 持久化
import realm from './realm';

// 保存用户信息
export function saveUserInfo(info) {
  console.log("保存用户信息");
  console.log(info);
  realm.write(() => {
    let allUsers = realm.objects('User');
    realm.delete(allUsers);
  })
  realm.write(()=>{
    realm.create('User', {
      id: info.id,
      name: info.name||"",
      token: info.token||"",
    }, true);
  });
}

export function readUserInfoById(id) {
  let userInfos = realm.objects('User');
  let length = userInfos.length;
  console.log("length"+length);
  return length > 0 ? userInfos[length-1] : undefined;
}
