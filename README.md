# NDCore1.0
A Fallback to ND-Framework 1.0

# ND_Core

<p  align="center">
  <img src="https://user-images.githubusercontent.com/86536434/193703880-5cb7deef-af37-42cc-8df2-b13332afee67.png" />
</p>

<p align='center'><b><a href="https://discord.gg/andys-development-857672921912836116">Discord</a></b>

<p align='center'><b><a href="https://ndfw.gitbook.io/nd-framework/">Documentation</a></b>

## Dependency:
[oxmysql](https://github.com/overextended/oxmysql/releases/download/v2.4.0/oxmysql.zip)

## Addons

* [Ox Inventory](https://github.com/overextended/ox_inventory/releases)
* [Character Selection](https://github.com/ND-Framework/ND_CharacterSelection)
* [No Characters (use framework without character selection)](https://github.com/ND-Framework/ND_NoCharacters)
* [Vehicle System](https://github.com/ND-Framework/ND_VehicleSystem)
* [Dealerships](https://github.com/ND-Framework/ND_Dealership)
* [Fuel (with nozzle and hose)](https://github.com/ND-Framework/ND_Fuel)
* [Nitro](https://github.com/ND-Framework/ND_Nitro)
* [Shot Spotter](https://github.com/ND-Framework/ND_ShotSpotter)
* [Banking](https://github.com/ND-Framework/ND_Banking)
* [Doorlocks](https://github.com/ND-Framework/ND_Doorlocks)
* [Properties](https://github.com/ND-Framework/ND_Properties)
* [Appearance Shops](https://github.com/ND-Framework/ND_AppearanceShops)

# Need support?
[![Discord](https://discordapp.com/api/guilds/857672921912836116/widget.png?style=banner3)](https://discord.gg/Z9Mxu72zZ6)

---------------------------------------------------------------

# ND_Characters

<p align="center">
  <img src="https://user-images.githubusercontent.com/86536434/193914535-e68e6ec0-66c9-46bb-8d0d-b609b7a5ba42.png" />
</p>
<p align='center'><b><a href="https://youtu.be/7A2PH-AB5FQ">Preview Video</a></b>

## Features:
* Character selection screen
* Create characters
* Edit characters
* Delete characters
* Switch character
* Customize ped (requires [fivem-appearance](https://github.com/pedr0fontoura/fivem-appearance/releases))
* Save data to each character

## Need support?
[![Need Support?](https://user-images.githubusercontent.com/86536434/147299047-73691b78-2690-4786-b58b-27d24e48a0d2.png)](https://discord.gg/Z9Mxu72zZ6)

<a href="https://youtu.be/7A2PH-AB5FQ"><img src="https://user-images.githubusercontent.com/86536434/193924515-adc5849c-7c79-46b4-b3b5-a8d8200a48b5.png" /></a>

---------------------------------------------------------------

# ND_Banking

### Dependencies:

* [**ND Core**](https://github.com/ND-Framework/ND_Core/releases)

* [**ox_lib**](https://github.com/overextended/ox_lib/releases)

### Need Support?
[![Discord](https://discordapp.com/api/guilds/857672921912836116/widget.png?style=banner3)](https://discord.gg/Z9Mxu72zZ6)

# Preview

**ATM:**

![image](https://user-images.githubusercontent.com/86536434/215471458-c065a3a3-b7cc-4913-ad5a-26ce10dee16e.png)

**Bank - home:**

![image](https://user-images.githubusercontent.com/86536434/215471727-9a2a801a-72ca-4d9c-a690-f4b4ad11df8b.png)

**Bank - invoices:**

![image](https://user-images.githubusercontent.com/86536434/215471844-6ff6db72-97f3-4ec0-9103-f65777f657b9.png)

**Bank - transfer:**

![image](https://user-images.githubusercontent.com/86536434/215471971-49b36967-c29e-45b9-aa05-53f50f85f317.png)

---------------------------------------------------------------

# ND_VehicleSystem

![NDVehicleSystem](https://user-images.githubusercontent.com/86536434/200143075-342da3a9-2304-4001-a1d7-fdb59936f912.png)


## Features:
* Own vehicles and store in garages.
* Land vehicle garages, helicopters, boats, and planes.
* Lock/Unlock vehicles with a key system.
* Share your vehicle keys with players.
* Lockpick vehicles.
* Hotwire vehicles
* Disable vehicle air control.
* Lock traffic & parked vehicles.
* Cruise control.
* Transfer ownership of vehicles.
* Save vehicle wheel angle.

## Exports:

**Server:**
|Export|Description|Parameter(s)|
|-|-|-|
|setVehicleOwned|save a vehicle to a character.|int: **Player source**, table: **vehicle properties**, boolean: **in garage or not**.|
|getVehicles|Get the vehicles a characater owns.|int: **ND Character id**.|
|giveKeys|Give keys vehicle keys to a player.|int: **Vehicle entity**, int: **Player source**, int: **Target player source**.|
|spawnOwnedVehicle|Spawn a vehicle the player owns.|int: **Player source**, int: **vehicle ID**, vec3: **Spawn coords**.|
|returnVehicleToGarage|Give keys vehicle keys to a player.|int: **Player source**, int: **Vehicle entity**, table: **vehicle properties**.|
|transferVehicle|Transfer a vehicle to another player.|int: **Vehicle database ID**, int: **Player source**, int: **Target player source**.|
|saveVehicleProperties|Save the vehicle properties.|int: **Player source**, int: **Vehicle entity**, table: **vehicle properties**.|

**Client:**
|Export|Description|Parameter(s)|
|-|-|-|
|getVehicleOwned|Check if a vehicle is owned by any player.|int: **Vehicle entity**.|
|isVehicleOwned|Check if the player owns the vehicle.|int: **Vehicle entity**.|
|hasVehicleKeys|Check if the player has keys to the vehicle.|int: **Vehicle entity**.|
|getClosestVehicle|Get the closest vehicle the player has keys to, the distance of the vehicle and player, and the coords of the vehicle.|boolean: **Only get owned vehicles or all vehicles with keys to**.|
|getVehicleLocked|Check if the vehicle is locked or unlocked.|int: **Vehicle entity**.|
|setVehicleLocked|Set the vehicle lock status.|int: **Vehicle entity**, boolean: **Locked or unlocked**.|
|lockpickVehicle|Begin lockpicking a nearby vehicle, returns if successful or not.||
|hotwireVehicle|Begin to hotwire current vehicle, returns if successful or not.||

---------------------------------------------------------------

# ND_Dealership

![NDDealership](https://user-images.githubusercontent.com/86536434/200143107-a4101898-1946-4df5-bfd3-8ef7c7ba0d86.png)

A vehicle-dealership for the ND Framework, directly integrated into ND Frameworks vehicle system addon.

## Features:
* Direct integration into the ND_VehicleSystem addon.
* View a car before you buy.
* Ability to send to your personal-garage or spawn directly outside after purchase.
* Test-Driving before purchase.

---------------------------------------------------------------

# ND_Fuel

<p align="center">
  <img src="https://user-images.githubusercontent.com/86536434/193705940-4a974196-6135-4950-b068-9f4de8e9d2f5.png" />
</p>
<p align='center'><b><a href="https://youtu.be/3YGlEahLZKY">Preview Video</a></b>

## Features:
* Nozzle & hose
* Pump UI
* Customize fuel consumption
* Purchase and refill Jerry Can

## Need support?
[![Need Support?](https://user-images.githubusercontent.com/86536434/147299047-73691b78-2690-4786-b58b-27d24e48a0d2.png)](https://discord.gg/Z9Mxu72zZ6)

<a href="https://youtu.be/3YGlEahLZKY"><img src="https://forum.cfx.re/uploads/default/original/4X/d/5/b/d5baf97a1adb1bcd992d457ad36a37c739de7d7c.jpeg" /></a>

---------------------------------------------------------------

# ND_ApperanceShops

<p align="center">
  <img src="https://user-images.githubusercontent.com/86536434/194549182-3d16a8ff-56e8-470e-a84d-aa77bb2c4c12.png" />
</p>
<p align='center'><b><a href="https://youtu.be/inipA_QjsQA">Preview Video</a></b>

## Features:
* Clothing stores
* Tattoo stores
* Barber shops
* Blips

## Dependencies:
* [ND Core](https://github.com/ND-Framework/ND_Core)
* [fivem-appearance](https://github.com/pedr0fontoura/fivem-appearance/releases)
* [ox library](https://github.com/overextended/ox_lib/releases)

## Need support?
[![Need Support?](https://user-images.githubusercontent.com/86536434/147299047-73691b78-2690-4786-b58b-27d24e48a0d2.png)](https://discord.gg/Z9Mxu72zZ6)

---------------------------------------------------------------

# ND_npwd

# ND_npwd

### config.json
```json
{
  "PhoneAsItem": {
    "enabled": false,
    "exportResource": "my-core-resource",
    "exportFunction": "myCheckerFunction"
  },
  "general": {
    "useResourceIntegration": true,
    "toggleKey": "f1",
    "toggleCommand": "phone",
    "defaultLanguage": "en"
  },
  "profanityFilter": {
    "enabled": false,
    "badWords": ["esx"]
  },
  "database": {
    "useIdentifierPrefix": true,
    "playerTable": "characters",
    "identifierColumn": "license",
    "identifierType": "license",
    "profileQueries": true,
    "phoneNumberColumn": "phone_number"
  },
  "debug": {
    "level": "error",
    "enabled": true,
    "sentryEnabled": true
  }
}
```

---------------------------------------------------------------

# ND_DoorLocks

<p align="center">
  <img src="https://user-images.githubusercontent.com/86536434/194176980-c823b751-e5ca-4b92-8eaa-3938cef79ea9.png" />
</p>
<p align='center'><b><a href="">Preview Video</a></b>

## Features:
* Lock/Unlock doors
* Job permsission
* Exports
* Synced

## Need support?
[![Need Support?](https://user-images.githubusercontent.com/86536434/147299047-73691b78-2690-4786-b58b-27d24e48a0d2.png)](https://discord.gg/Z9Mxu72zZ6)

---------------------------------------------------------------

# ND_Properties

<p align="center">
  <img src="https://user-images.githubusercontent.com/86536434/195198946-8c2e6bcf-523c-4751-8d70-fa800861ccf4.png" />
</p>
<p align='center'><b><a href="https://youtu.be/qR8pZ-Xw98I">Preview Video</a></b>

## Features:
* Purchase properties
* Grant access to players
* Remove access from players
* Sell property (coming soon)

## Dependencies
* [ND Core](https://github.com/ND-Framework/ND_Core)
* [ND Doorlocks](https://github.com/ND-Framework/ND_Doorlocks)
* [ox library](https://github.com/overextended/ox_lib/releases)
* [oxmysql](https://github.com/overextended/oxmysql/releases)

## Need support?
[![Need Support?](https://user-images.githubusercontent.com/86536434/147299047-73691b78-2690-4786-b58b-27d24e48a0d2.png)](https://discord.gg/Z9Mxu72zZ6)

<a href="https://youtu.be/qR8pZ-Xw98I"><img src="https://user-images.githubusercontent.com/86536434/195199592-9a6d8366-9820-4684-a1fb-c44c823db0e6.png" /></a>

---------------------------------------------------------------

# ND_Nitro

<p align="center">
  <img src="https://user-images.githubusercontent.com/86536434/201419455-72e1bf11-c1fa-4842-bb18-3f0e62cdec5f.png" />
</p>
<p align='center'><b><a href="discord.gg/nc82d8zvjm">Discord</a></b>

## Dependency:
[ox inventory](https://github.com/overextended/ox_inventory/releases)

#### Create this item:
```lua
["nos"] = {
    label = "NOS Bottle",
    weight = 2000,
    stack = false,
    close = true,
    client = {
        disable = { move = true, car = true, combat = true },
        usetime = 3500,
        cancel = true,
        export = "ND_Nitro.nos"
    }
},
```

# Need support?
[![Need Support?](https://user-images.githubusercontent.com/86536434/147299047-73691b78-2690-4786-b58b-27d24e48a0d2.png)](https://discord.gg/Z9Mxu72zZ6)

---------------------------------------------------------------
