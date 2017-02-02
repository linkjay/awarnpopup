util.AddNetworkString( "link_awarnpopup" )

hook.Add("AWarnPlayerWarned", "linkawarndetector", function(target, admin, reason)
	if IsValid(target) then
		local calling_person

		if not IsValid(admin) then
			calling_person = "CONSOLE"
		else
			calling_person = admin:GetName()
		end 

		net.Start( "link_awarnpopup" )
		net.WriteString(calling_person)
		net.WriteString(reason)
		net.Send(target)
	end
end)
