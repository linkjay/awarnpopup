util.AddNetworkString( "link_awarnpopup" )

hook.Add("AWarnPlayerWarned", "linkawarndetector", function(target, admin, reason)
	if IsValid(target) then
		net.Start( "link_awarnpopup" )
		net.WriteString(reason)
		net.Send(target)
	end
end)