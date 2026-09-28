-- ====================================================================
-- Apple Physics Curves Engine (Production Standard Spec)
-- File: ~/.config/hypr/config/animations.lua
-- ====================================================================

-- 1. APPLE CANONICAL SPRINGS (Khóa cứng mass = 1.0 theo chuẩn WWDC)

-- SwiftUI .snappy (ζ = 0.866, OS ≈ 0.43%): Nảy vi mô, dứt khoát, đầm chắc
hl.curve("appleSnappy",    { type = "spring", mass = 1.0, stiffness = 300.0, dampening = 30.0 })

-- SwiftUI .smooth (ζ = 0.998 ≈ 1.0, OS = 0%): Critically Damped tuyệt đối, trượt phẳng
hl.curve("appleSmooth",    { type = "spring", mass = 1.0, stiffness = 52.0,  dampening = 14.4 })

-- SwiftUI .bouncy (ζ = 0.705, OS ≈ 4.45%): Nảy đàn hồi rõ nét cho OSD / Notification
hl.curve("appleBouncy",    { type = "spring", mass = 1.0, stiffness = 197.0, dampening = 19.8 })


-- 2. KINEMATICS BEZIERS (Dành riêng cho Alpha & Exit)

-- Apple Exit: Triệt tiêu visual nhanh dứt khoát, giải phóng nhận thức
hl.curve("appleExit",      { type = "bezier", points = { {0.32, 0.0}, {0.67, 0.0} } })

-- Apple Fade: Giữ độ trong suốt đầu pha để bọc nhịp bung nở lò xo
hl.curve("appleFade",      { type = "bezier", points = { {0.2, 0.6}, {0.35, 1.0} } })


-- ====================================================================
-- ANIMATIONS MAPPING
-- ====================================================================

-- Master switch
hl.animation({ leaf = "global", enabled = true, speed = 3.0, spring = "appleSnappy" })

-- CỬA SỔ (Windows)
-- Popin 97% + appleSnappy: Bung nở vi mô 3%, triệt tiêu hoàn toàn cảm giác lao vào mặt
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 2.8, spring = "appleSnappy", style = "popin 97%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 2.0, bezier = "appleExit",   style = "popin 96%" })

-- Tiling re-flow: Hít vào layout mới dứt khoát
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3.2, spring = "appleSnappy" })

-- ĐỘ TRONG SUỐT (Fade)
hl.animation({ leaf = "fadeIn",      enabled = true, speed = 2.6, bezier = "appleFade" })
hl.animation({ leaf = "fadeOut",     enabled = true, speed = 1.8, bezier = "appleExit" })
hl.animation({ leaf = "fadeSwitch",  enabled = true, speed = 2.2, bezier = "appleFade" })
hl.animation({ leaf = "fadeDim",     enabled = true, speed = 2.5, bezier = "appleFade" })

-- WORKSPACES
-- Trượt phẳng 120Hz ProMotion, 0% dao động thừa
hl.animation({ leaf = "workspaces",  enabled = true, speed = 3.4, spring = "appleSnappy", style = "slide" })

-- SPECIAL WORKSPACE (Mission Control / Scratchpad)
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 3.0, spring = "appleSmooth", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2.0, bezier = "appleExit",   style = "slide top" })

-- LAYERS (Waybar, Rofi, Context Menu, Tooltip)
hl.animation({ leaf = "layersIn",    enabled = true, speed = 2.4, spring = "appleSnappy", style = "popin 98%" })
hl.animation({ leaf = "layersOut",   enabled = true, speed = 1.8, bezier = "appleExit",   style = "popin 98%" })
