provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "Tera" {
  name     = "Tera-resource-group"
  location = "eastus"  
}

resource "azurerm_virtual_network" "Tera" {
  name                = "myVNet"
  resource_group_name = azurerm_resource_group.Tera.name
  location            = azurerm_resource_group.Tera.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "Tera" {
  name                 = "mySubnet"
  resource_group_name  = azurerm_resource_group.Tera.name
  virtual_network_name = azurerm_virtual_network.Tera.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Define the public IP address for the network interface
resource "azurerm_public_ip" "Tera" {
  name                = "myPublicIP"
  location            = azurerm_resource_group.Tera.location
  resource_group_name = azurerm_resource_group.Tera.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "Tera" {
  name                = "myNIC"
  location            = azurerm_resource_group.Tera.location
  resource_group_name = azurerm_resource_group.Tera.name

  ip_configuration {
    name                          = "myIPConfig"
    subnet_id                     = azurerm_subnet.Tera.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.Tera.id


  }
}

resource "azurerm_virtual_machine" "Tera" {
  name                  = "tera-deployed"                 
  location              = azurerm_resource_group.Tera.location
  resource_group_name   = azurerm_resource_group.Tera.name
  vm_size               = "Standard_B1s"      
   network_interface_ids = ["/subscriptions/40ebc43e-5a53-4ada-ad82-110b86f3986d/resourceGroups/Tera-resource-group/providers/Microsoft.Network/networkInterfaces/myNIC"]
    
 
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"                      
    version   = "latest"
  }

  os_profile {
    computer_name  = "tera-deployed"                     
    admin_username = "chinmay"                

    admin_password = "Password123!"              
  }

    storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
