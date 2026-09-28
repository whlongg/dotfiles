-- ====================================================================
-- Apple Physics Curves Engine
-- File: ~/.config/hypr/config/animations.lua
-- ====================================================================

-- 1. Spring cửa sổ mở: Nảy vi mô 1.5%
hl.curve("appleWindowIn",   { type = "spring", mass = 0.9, stiffness = 420, dampening = 30 })

-- 2. Spring kéo thả/di chuyển: Bám dính tay
hl.curve("appleWindowMove", { type = "spring", mass = 1.0, stiffness = 380, dampening = 36 })

-- 3. Hãm phanh Workspace: Critically Damped (0% nảy, trượt phẳng 120Hz)
hl.curve("appleWorkspace",  { type = "spring", mass = 1.0, stiffness = 320, dampening = 35.8 })

-- 4. Bezier đóng cửa sổ: Biến mất dứt khoát
hl.curve("appleExit",       { type = "bezier", points = { {0.3, 0.0}, {0.8, 0.15} } })

-- 5. Bezier mờ đục
hl.curve("appleFade",       { type = "bezier", points = { {0.25, 1.0}, {0.5, 1.0} } })


-- ====================================================================
-- Animations Mapping
-- ====================================================================

-- Master switch
hl.animation({ leaf = "global", enabled = true, speed = 3.2, spring = "appleWindowIn" })

-- CỬA SỔ (Windows)
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 3.2, spring = "appleWindowIn", style = "popin 92%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 2.0, bezier = "appleExit",     style = "popin 95%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3.4, spring = "appleWindowMove" })

-- ĐỘ TRONG SUỐT & CHUYỂN CẢNH (Fade)
hl.animation({ leaf = "fadeIn",      enabled = true, speed = 2.5, bezier = "appleFade" })
hl.animation({ leaf = "fadeOut",     enabled = true, speed = 1.8, bezier = "appleExit" })
hl.animation({ leaf = "fadeSwitch",  enabled = true, speed = 2.2, bezier = "appleFade" })
hl.animation({ leaf = "fadeDim",     enabled = true, speed = 2.5, bezier = "appleFade" })

-- KHÔNG GIAN LÀM VIỆC (Workspaces)
hl.animation({ leaf = "workspaces",  enabled = true, speed = 3.6, spring = "appleWorkspace", style = "slide" })

-- SPECIAL WORKSPACE
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 3.4, spring = "appleWindowIn", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2.2, bezier = "appleExit",     style = "slide top" })

-- LAYERS (Waybar, Rofi, Context Menu)
hl.animation({ leaf = "layersIn",    enabled = true, speed = 2.8, spring = "appleWindowIn", style = "fade" })
hl.animation({ leaf = "layersOut",   enabled = true, speed = 2.0, bezier = "appleExit",     style = "fade" })
