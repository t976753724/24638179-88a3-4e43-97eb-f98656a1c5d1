--先清空相册，然后从选中的文件夹中随机上传一张照片到相册中，然后打开相册
--images是图片所在文件夹
-- 清空相册
device.album_clear(true, true)
sleep(1000)
-- 获取图片文件夹下的所有文件
local files = dir.get_files(params.images)
log_success('获取到 ' .. files.count .. ' 个图片文件')
if files.success and files.count > 0 then
    -- 随机选择一张图片
    local random_index = math.random(1, files.count)
    local image_path = files.files[random_index]
    
    -- 上传到相册
    device.album_upload(image_path)
    sleep(2000)
    
    -- 刷新媒体库
    device.album_refresh()
    sleep(1000)
    
    -- 点击打开相册
    local album_node = device.find_node('相册', 'desc')
    if album_node then
        device.tap_node(album_node)
        else
        device.start_app("com.android.gallery3d")
    end
end


--点击开始计时
