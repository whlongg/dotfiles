-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly
-- hl.monitor({
--     output    = MONITOR1,
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })

hl.monitor({
    output    = "DP-1",              -- Cổng xuất hình thực tế
    mode      = "2560x1440@120",     -- Kích hoạt mức 120Hz cao nhất
    position  = "0x0",
    scale     = "1",                 -- Giữ nguyên 100% để hiển thị 2K sắc nét
    vrr       = 1,                   -- Bật Adaptive-Sync / FreeSync
})

hl.monitor({
    output    = "HDMI-A-1",
    mode      = "1920x1080@100",
    position  = "-1080x0",              -- Đặt ngay sát mép phải của màn 2K (chiều ngang 2560)
    scale     = "1",
    transform = 1,                     -- 1 = xoay 90 độ theo chiều kim đồng hồ (đổi thành 3 nếu bị ngược đầu)
    vrr       = 1,                     -- Màn dọc đọc docs/code thì tắt VRR để tránh nháy khung hình
})
