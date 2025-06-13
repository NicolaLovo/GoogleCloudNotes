# Adding an admin user

Needs to have less privileges than the **Super Admin**: follow the least-privilege principle.

Super admin:

- irrevocable admin permissions
- grants organization admin role and other roles
- recover accounts at the domain level

## Create a billing account user

Objective: link my billing account to another user so that he can use it to pay for his projects

Billing > Account management > Add principal

I can create a new user with "Billing Account User" permission. This user will be able to create projects that bill to this account.

> [!IMPORTANT]
> A billing account can pay for a project in a different organization. Simply add the billing user role to the user in the other organization.
