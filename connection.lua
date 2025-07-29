local frame = {}

frame = Instance.new("Frame", Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui))
frame.Size = UDim2.new(1, 0, 1.2, 0)
frame.Position = UDim2.new(0, 0, -0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.ZIndex = 20 frame.Name = "ConnectionWaiting"

local textLabel = Instance.new("TextLabel", frame)
textLabel.RichText = true
textLabel.Text = "Waiting For CONNECTIONs...<br/><font size='14'>(host account must chat 'CONNECT' in order to link)</font>"
textLabel.Size = UDim2.new(1, 0, 0.1, 0)
textLabel.Position = UDim2.new(0.5, 0, 0.55, 0)
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Font = Enum.Font.Gotham
textLabel.ZIndex = 21

return frame
