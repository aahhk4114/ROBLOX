local Translations = {
    ["RedLight"] = "红绿灯",
    ["Teleport to End"] = "传送到终点",
    ["Red Light Green Light Godmode"] = "红绿灯上帝模式",
    ["Remove Injury"] = "移除伤害",
    ["Dalgona"] = "糖饼游戏",
    ["Tug Of War"] = "拔河",
    ["Hide And Seek"] = "捉迷藏",
    ["Jump Rope/Glass Bridge"] = "跳绳/玻璃桥",
    ["Help Player LOOP TILL OFF"] = "循环帮助玩家直到关闭",
    ["Mingle"] = "社交时间",
    ["Random Features"] = "随机功能",
    ["Rebel"] = "反抗",
    ["Final"] = "最终关卡",
    ["FLING ALL HAS RISK FOR BAN"] = "抛掷所有玩家有封禁风险",
    ["Fling All Players (INSANE OP)"] = "抛掷所有玩家(极其强大)",
    ["End Fling All Players Early"] = "提前结束抛掷所有玩家",
    ["NOTE THIS IS TESTING BUT ITS TO AUTOPLAY"] = "注意：这是测试功能，用于自动游戏",
    ["Auto Play (AFK Everything)"] = "自动游戏(挂机一切)",
    ["Auto Complete Dalgona"] = "自动完成糖饼游戏",
    ["Free Lighter"] = "免费打火机",
    ["NOTE THE ANTIPUSH NOT ALWAYS WORK"] = "注意：防推功能并不总是有效",
    ["ANTIPUSH (BETA)"] = "防推功能(测试版)",
    ["Not Get Pushed When Someone Pushes"] = "当有人推时不会被推",
    ["Auto Kill NPC Guards"] = "自动杀死NPC守卫",
    ["Rebel Aimbot"] = "反抗自瞄",
    ["BE CARFUL USING THIS COULD RISK IN BAN"] = "小心使用，这可能导致封禁",
    ["Expand Rebel Hitbox"] = "扩大反抗命中框",
    ["Auto Mingle Choke"] = "自动窒息",
    ["Noclip"] = "穿墙模式",
    ["Auto Win Mingle"] = "自动赢得社交时间",
    ["GETS RID OF THE ROPE AND Creates Platform"] = "移除绳子并创建平台",
    ["THE THINGS BELOW IS FOR GLASS BRIDGE"] = "以下功能适用于玻璃桥",
    ["Enable Glass ESP"] = "启用玻璃透视",
    ["Troll Players Glass Bridge"] = "恶搞玩家玻璃桥",
    ["TP to End (Glass Bridge)"] = "传送到终点(玻璃桥)",
    ["TP to End (Jump Rope)"] = "传送到终点(跳绳)",
    ["Delete The Rope"] = "删除绳子",
    ["ESP Exit Doors"] = "透视出口门",
    ["ESP Exit Doors in Hide And Seek"] = "在捉迷藏中透视出口门",
    ["ESP Keys"] = "透视钥匙",
    ["Teleport to Random Hider"] = "传送到随机隐藏者",
    ["KILL AURA (EXTREMLY SAFE)"] = "杀戮光环(极其安全)",
    ["Pretty Safe Kill Aura Almost Impossible To Die"] = "相当安全的杀戮光环，几乎不可能死亡",
    ["Teleport 40 Blocks Down"] = "向下传送40个方块",
    ["Delete the spikes"] = "删除尖刺",
    ["The spikes Wont kill you if you fall"] = "如果你掉落，尖刺不会杀死你",
    ["Esp Hider & Seeker"] = "透视隐藏者和寻找者",
    ["KILL HIDERS (BETA)"] = "杀死隐藏者(测试版)",
    ["YOU HAVE TO MANUALLY CLICK TO DO DAMAGE"] = "你需要手动点击造成伤害",
    ["Teleport 100 Blocks Up"] = "向上传送100个方块",
    ["The spikes Wont kill you if you fail"] = "如果你失败，尖刺不会杀死你",
    ["Tug of War Auto (NEW)"] = "自动拔河(新)",
    ["Bring Back People Start (TROLL)"] = "带回人员起始位置(恶搞)",
    ["Auto Collect Bandage"] = "自动收集绷带",
    ["SKY SQUID GAME"] = "天空鱿鱼游戏",
    ["GODMODE (BETA)"] = "上帝模式(测试版)",
    ["Teleports up if LOW"] = "如果位置低则向上传送",
    ["INSTA GRAB Poles"] = "立即抓住杆子",
    ["IT WILL AUTO TP AND GRAB POLES WHEN FREE"] = "空闲时将自动传送并抓住杆子",
    ["POLES WITH FIRE"] = "带火的杆子",
    ["Touch Fling"] = "接触抛掷",
    ["TP TO ALL PEABERT (BETA)"] = "传送到所有PEABERT(测试版)",
    ["TP TO ALL PEABERT AND CLICK"] = "传送到所有PEABERT并点击",
    ["on the things automatically"] = "自动点击物品",
    ["Select emotes to use"] = "选择要使用的表情",
    ["Play Selected Emotes"] = "播放选中的表情",
    ["Stop Emoting"] = "停止表情",
    ["Auto Skip"] = "自动跳过",
    ["Auto Presses the Skip Button"] = "自动按下跳过按钮",
    ["Fly Speed"] = "飞行速度",
    ["Enter fly speed (5-100)"] = "输入飞行速度(5-100)",
    ["Select Player"] = "选择玩家",
    ["Teleport to Selected Player"] = "传送到选中的玩家",
    ["Refresh Player list"] = "刷新玩家列表",
    ["Reset WalkSpeed to Normal"] = "重置移动速度到正常",
    ["AntiFling"] = "防抛掷",
    ["Fly (BETA)"] = "飞行(测试版)",
    ["Unlock Dash Free"] = "免费解锁冲刺",
    ["Equip Phantom Power Free"] = "免费装备幻影之力",
    ["WalkSpeed Increase (CHOOSE BELOW)"] = "移动速度增加(下方选择)",
    ["WalkSpeed Amount"] = "移动速度数值"
}

local function translateText(text)
    if not text or type(text) ~= "string" then return text end
    
    if Translations[text] then
        return Translations[text]
    end
    
    for en, cn in pairs(Translations) do
        if text:find(en) then
            return text:gsub(en, cn)
        end
    end
    
    return text
end

local function setupTranslationEngine()
    local success, err = pcall(function()
        local oldIndex = getrawmetatable(game).__newindex
        setreadonly(getrawmetatable(game), false)
        
        getrawmetatable(game).__newindex = newcclosure(function(t, k, v)
            if (t:IsA("TextLabel") or t:IsA("TextButton") or t:IsA("TextBox")) and k == "Text" then
                v = translateText(tostring(v))
            end
            return oldIndex(t, k, v)
        end)
        
        setreadonly(getrawmetatable(game), true)
    end)
    
    if not success then
        warn("元表劫持失败:", err)
       
        local translated = {}
        local function scanAndTranslate()
            for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do
                if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) and not translated[gui] then
                    pcall(function()
                        local text = gui.Text
                        if text and text ~= "" then
                            local translatedText = translateText(text)
                            if translatedText ~= text then
                                gui.Text = translatedText
                                translated[gui] = true
                            end
                        end
                    end)
                end
            end
            
            local player = game:GetService("Players").LocalPlayer
            if player and player:FindFirstChild("PlayerGui") then
                for _, gui in ipairs(player.PlayerGui:GetDescendants()) do
                    if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) and not translated[gui] then
                        pcall(function()
                            local text = gui.Text
                            if text and text ~= "" then
                                local translatedText = translateText(text)
                                if translatedText ~= text then
                                    gui.Text = translatedText
                                    translated[gui] = true
                                end
                            end
                        end)
                    end
                end
            end
        end
        
        local function setupDescendantListener(parent)
            parent.DescendantAdded:Connect(function(descendant)
                if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
                    task.wait(0.1)
                    pcall(function()
                        local text = descendant.Text
                        if text and text ~= "" then
                            local translatedText = translateText(text)
                            if translatedText ~= text then
                                descendant.Text = translatedText
                            end
                        end
                    end)
                end
            end)
        end
        
        pcall(setupDescendantListener, game:GetService("CoreGui"))
        local player = game:GetService("Players").LocalPlayer
        if player and player:FindFirstChild("PlayerGui") then
            pcall(setupDescendantListener, player.PlayerGui)
        end
        
        while true do
            scanAndTranslate()
            task.wait(3)
        end
    end
end

task.wait(2)

setupTranslationEngine()

local success, err = pcall(function()
-- 这下面填加载外部脚本
loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
end)

if not success then
    warn("加载失败:", err)
end
