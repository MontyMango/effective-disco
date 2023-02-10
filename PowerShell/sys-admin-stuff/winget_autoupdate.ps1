# Agree to the Terms of Transaction
# " The `msstore` source requires that you view the following agreements before using.
#   Terms of Transaction: https://aka.ms/microsoft-store-terms-of-transaction "
winget upgrade --accept-source-agreements --accept-package-agreements

# Now upgrade all winget applications
winget upgrade -r --force
