# verify_oci.py
import oci, sys
config = oci.config.from_file()  # ~/.oci/config
identity = oci.identity.IdentityClient(config)
compartments = identity.list_compartments(config["tenancy"])
print("Compartment count:", len(compartments.data))

