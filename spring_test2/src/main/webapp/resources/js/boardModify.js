console.log("modifyin");

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('file-x')){
        let uuid = e.target.dataset.uuid;
        console.log(uuid);
        removeFileToServer(uuid).then(result =>{
            if(result == '1'){
                alert("파일삭제!");
                e.target.closest('li').remove();
            }
        })
    }
});

//비동기 메서드 맵핑방법 : post, get, put, delete
async function removeFileToServer(uuid){
    try {
        const url = "/board/file/"+uuid;
        const config={
            method: 'delete'
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}