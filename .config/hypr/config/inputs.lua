-- Input configuration

hl.config({
    input = {
        -- Tốc độ lặp phím (Khắc phục hoàn toàn khựng nút xóa)
        repeat_delay = 180,       -- Hạ xuống 110-120ms (thay vì 150ms) để nhịp đầu ăn ngay tức thì
        repeat_rate = 30,         -- Đẩy lên 40-45 Hz để tua phím mượt mà như macOS (KeyRepeat = 2)

        -- Chuột phẳng (Raw input 1:1, tắt gia tốc)
        accel_profile = "flat",
        force_no_accel = true,
        sensitivity = 0.0,
    },
    -- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
    -- cursor = {
    --     no_hardware_cursors = 1,
    -- },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })

