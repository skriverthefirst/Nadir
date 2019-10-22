# Smart devices controller, REST API

## Usage
All responses will have the form

```json
{
    "data": "Containing mixed data for smart devices"
}
```

### List all devices

**Definition**

`GET /devices`

**Response**

- `200 OK` on success

```json
[
    {
        "identifier": "kitchen-bulb",
        "name": "Kitchen Bulb",
        "device_type": "bulb",
        "controller_gateway": "192.168.1.2"
    },
    {
        "identifier": "living-room-bulb",
        "name": "Living Room Bulb",
        "device_type": "bulb",
        "controller_gateway": "192.168.1.2"
    }
]
```

### Registering a new device

**Definition**

`POST /devices`

**Arguments**

- `"identifier":string` a globally unique identifier for this device
- `"name":string` a friendly name for this device
- `"device_type":string` the type of the device as understood by the client
- `"controller_gateway":string` the IP address of the device's controller

If a device with the given identifier already exists, the existing device will be overwritten.

**Response**

- `201 Created` on success

```json
{
    "identifier": "kitchen-bulb",
    "name": "Kitchen Bulb",
    "device_type": "bulb",
    "controller_gateway": "192.168.1.2"
}
```

## Lookup device details

`GET /device/<identifier>`

**Response**

- `404 Not Found` if the device does not exist
- `200 OK` on success

```json
{
    "identifier": "kitchen-bulb",
    "name": "Kitchen Bulb",
    "device_type": "bulb",
    "controller_gateway": "192.168.1.2"
}
```

## Delete a device

**Definition**

`DELETE /devices/<identifier>`

**Response**

- `404 Not Found` if the device does not exist
- `204 No Content` on success