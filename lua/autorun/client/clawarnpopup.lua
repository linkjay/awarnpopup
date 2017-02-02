AddCSLuaFile()

function link_awarnpopup()
	local calling_person = net.ReadString()
	local reason = net.ReadString()

	surface.PlaySound("common/warning.wav")
	
	--All of the derma
	local main = vgui.Create( "DFrame" )
	main:SetTitle( " " )
	main:SetPos(ScrW() / 2 - 225, ScrH() / 2 - 150)
	main:SetSize( 450, 250 )
	main:ShowCloseButton( false )
	main:SetDraggable(false)
	main:MakePopup(true)
	main.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(42, 41, 47, 255))
	end

	local main2 = vgui.Create( "DFrame", main )
	main2:SetTitle( " " )
	main2:SetPos( ScrW() / 2 - 225, ScrH() / 2 - 180 )
	main2:SetSize( 450, 30 )
	main2:ShowCloseButton( false )
	main2:SetDraggable(false)
	main2:MakePopup(true)
	main2.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(32, 31, 36, 255))
	end

	local titleText = vgui.Create( "DLabel", main2 )
	titleText:SetPos( 135.5, 0 )
	titleText:SetSize( 500, 30)
	titleText:SetText( "Warning Notification")
	titleText:SetFont( "Trebuchet24")
	titleText:SetTextColor( Color( 204, 0, 0, 255 ))

	if string.len(calling_person) >= 16 then
		local mainMsgPanel = vgui.Create( "DPanel", main )
		mainMsgPanel:SetPos( -25, 30 )
		mainMsgPanel:SetSize( 500, 100 )
		mainMsgPanel.Paint = function()
			draw.SimpleText( "You have been issued a warning by", "HudHintTextLarge", 500 / 2, 50 / 2, Color( 204, 0, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		local mainMsgPanel2 = vgui.Create( "DPanel", main )
		mainMsgPanel2:SetPos( -25, 45 )
		mainMsgPanel2:SetSize( 500, 100 )
		mainMsgPanel2.Paint = function()
			draw.SimpleText( calling_person .. "!", "HudHintTextLarge", 500 / 2, 50 / 2, Color( 204, 0, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	else
		local mainMsgPanel3 = vgui.Create( "DPanel", main )
		mainMsgPanel3:SetPos( -25, 30 )
		mainMsgPanel3:SetSize( 500, 100 )
		mainMsgPanel3.Paint = function()
			draw.SimpleText( "You have been issued a warning by " .. calling_person .. "!", "HudHintTextLarge", 500 / 2, 50 / 2, Color( 204, 0, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end

	local reasonPanel = vgui.Create( "DPanel", main )
	reasonPanel:SetPos( -25, 90 )
	reasonPanel:SetSize( 500, 100 )
	reasonPanel.Paint = function()
		draw.SimpleText( reason, "HudHintTextLarge", 500 / 2, 50 / 2, Color( 204, 0, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	local closeButton = vgui.Create( "DButton", main )
	closeButton:SetText( "Close" )
	closeButton:SetTextColor( Color(0, 153, 255))
	closeButton:SetPos( 252.5, 190 )
	closeButton:SetSize( 125, 30 )
	closeButton.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(32, 31, 36, 255))
	end
	closeButton.DoClick = function()
		main:Remove()
	end

	local viewWarnsButton = vgui.Create( "DButton", main )
	viewWarnsButton:SetText( "History" )
	viewWarnsButton:SetTextColor( Color(0, 153, 255))
	viewWarnsButton:SetPos( 72.5, 190 )
	viewWarnsButton:SetSize( 125, 30 )
	viewWarnsButton.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(32, 31, 36, 255))
	end
	viewWarnsButton.DoClick = function()
		main:Remove()
		net.Start( "awarn_openmenu" )
		net.SendToServer()
	end
end
net.Receive( "link_awarnpopup", link_awarnpopup)
