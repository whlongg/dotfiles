-- ====================================================================
-- Authentic Apple HIG: Solid Surface with Precision Depth & Materials
-- ====================================================================

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 12,
        border_size = 1,
        extend_border_grab_area = 10,
        resize_on_border = true,

        -- Viền Hairline chuẩn Retargeting Display của Apple
        -- Dùng white-stroke tinh tế để tách lớp cửa sổ trên Dark Mode
        col = {
            active_border = "rgba(ffffff1a)",   -- 10% white: sắc nét nhưng không gắt
            inactive_border = "rgba(ffffff08)", -- 3% white: chìm nhẹ khi mất focus
        },
    },

    decoration = {
        -- 14-16px là tỷ lệ vàng của macOS Sonoma/Sequoia trên màn 2K
        rounding = 14,

        -- BẮT BUỘC: Giữ 1.0 cho content. Để windowrules tự xử lý riêng cho Terminal/Sidebar
        active_opacity = 1.0,
        inactive_opacity = 0.96,
        fullscreen_opacity = 1.0,

        dim_inactive = false,
        dim_special = 0.15,

        blur = {
            enabled = true,
            -- Giảm pass, tăng tính chuẩn xác: passes=2 + size=6 cho ra độ mịn tương đương nhưng nhẹ gấp đôi
            size = 6,
            passes = 2,
            new_optimizations = true,
            xray = false,

            -- Tái tạo Apple Desktop Acrylic Material
            noise = 0.015,
            contrast = 0.92,
            brightness = 1.0,
            vibrancy = 0.35,
            vibrancy_darkness = 0.05,

            -- CHỈ blur app có alpha channel thực sự (như terminal, dock, bar)
            -- Giải phóng 60-70% GPU fill-rate khi mở đa nhiệm
            ignore_opacity = false,
            popups = true,
            popups_ignorealpha = 0.2,
            special = false,                    -- Tắt trên special workspace để tránh lag khi switch
        },

        shadow = {
            enabled = true,
            -- Tái tạo tán xạ ánh sáng tự nhiên, giảm tải rasterization
            range = 32,
            render_power = 2,                   -- Falloff mềm mại đúng tính chất ánh sáng vật lý
            offset = "0, 8",                    -- Nguồn sáng Key Light 90 độ giả lập từ trên xuống
            color = "rgba(00000040)",           -- Đậm vừa đủ ở vùng tiếp giáp
            color_inactive = "rgba(00000020)",
        },
    },

    group = {
        col = {
            border_active = "rgba(ffffff20)",
            border_inactive = "rgba(00000000)",
            border_locked_active = "rgba(ffffff20)",
            border_locked_inactive = "rgba(00000000)",
        },
        groupbar = {
            font_family = "SF Pro Text",        -- SF Pro Text đọc tốt hơn Display ở size nhỏ
            font_size = 10,
            gradients = false,
            col = {
                active = "rgba(ffffff12)",
                inactive = "rgba(00000018)",
                locked_active = "rgba(ffffff12)",
                locked_inactive = "rgba(00000018)",
            },
        },
    },
})
