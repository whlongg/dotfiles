-- ====================================================================
-- Look and feel configuration (macOS Minimalist & Frosted Glass)
-- ====================================================================

hl.config({
    general = {
        gaps_in = 2,                        -- Tăng khoảng thở giữa các cửa sổ
        gaps_out = 12,                      -- Khoảng cách tới mép màn hình rộng rãi hơn
        border_size = 1,                    -- Hạ viền xuống 1px thanh mảnh
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            -- Viền kính mờ phản chiếu ánh sáng (Trắng mờ 20% / 5%)
            active_border = "rgba(ffffff33)",
            inactive_border = "rgba(ffffff0d)",
        },
    },
    group = {
        col = {
            border_active = "rgba(ffffff40)",
            border_inactive = "rgba(ffffff10)",
            border_locked_active = "rgba(ffffff40)",
            border_locked_inactive = "rgba(ffffff10)",
        },
        groupbar = {
            col = {
                active = "rgba(ffffff40)",
                inactive = "rgba(00000040)",
                locked_active = "rgba(ffffff40)",
                locked_inactive = "rgba(00000040)",
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 12,                      -- Bo góc 12px chuẩn tỉ lệ bo cong macOS
        active_opacity = 0.96,              -- Giữ chữ nét căng, nền trong suốt nhẹ
        inactive_opacity = 0.88,
        fullscreen_opacity = 1.0,

        -- Tán xạ kính mờ chuẩn Dual-Kawase
        blur = {
            enabled = true,
            size = 6,
            passes = 3,                     -- 3 passes kết hợp size 6 vừa mượt vừa nhẹ GPU
            new_optimizations = true,
            vibrancy = 0.25,                -- Đẩy độ rực màu của hình nền xuyên qua kính
            vibrancy_darkness = 0.3,
            special = true,
        },

        -- Bóng đổ tách lớp cửa sổ bay bổng
        shadow = {
            enabled = true,
            range = 24,                     -- Tán rộng mềm mại
            render_power = 3,
            color = "rgba(00000040)",       -- Đen mờ 25%
        },
    },
})
