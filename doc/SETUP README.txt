	
1.
	Take the folders; "pa" and "ui", as well as "modinfo.json" and place them in this filepath:

		C:\Users\USERNAME\AppData\Local\Uber Entertainment\Planetary Annihilation\server_mods\RCBM

	If you don't currently have this filepath and folders, please create them.

2.
	Take the file "modsNoCheats.json" and place it inside this filepath:

		C:\Users\USERNAME\AppData\Local\Uber Entertainment\Planetary Annihilation\server_mods

	Rename the file to "mods.json".

3. 	
	Copy "ui" and "modinfo.json" and place them inside this filepath:

		C:\Users\USERNAME\AppData\Local\Uber Entertainment\Planetary Annihilation\client_mods\RCBM

4.
	Open this new "modinfo.json" (...\client_mods\RCBM) in a text editor and change 
		"context": "server",
	to
		"context": "client",
	Then save the file.

IF YOU ARE USING PAMM SKIP STEP 5.
5.
	copy "mods.json" from ...\server_mods and place it inside ...\client_mods.	


IF YOU ARE NOT USING PAMM SKIP STEPS 6. AND 7.

6.
	Open "modinfo.json" (...\client_mods\RCBM) in a text editor and change 
		"identifier" : "com.realmmods.rebalance"
	to
		"identifier" : "com.realmmods.rebalanceUI"
		
	and
	
		"display_name" : "The Realm Community Rebalance"
	to
		"display_name" : "The Realm Community Rebalance UI"
	Then save the file.
	
7.
	Open PAMM and under "UI mods" tab find 	"The Realm Community Rebalance UI" and disable it, then enable it again.

8.
	Launch Planetary Annihilation and have fun! Remember to tell your teammates to set their filters to see modded games and you should be good to host a game for anyone to join.
	