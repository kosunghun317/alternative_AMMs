# pragma version ^0.3.10

from vyper.interfaces import ERC20

fund: HashMap[address, HashMap[address, uint256]] # owner -> token -> balance

@external
def deposit(token: address, amount: uint256):
    assert ERC20(token).transferFrom(msg.sender, self, amount, default_return_value=True)
    self.fund[msg.sender][token] += amount

@external
def withdraw(token: address, amount: uint256):
    self.fund[msg.sender][token] -= amount
    assert ERC20(token).transfer(msg.sender, amount, default_return_value=True)

# TODO: create_pair logic
# TODO: submit_order logic
# TODO: settle_batch logic
# TODO: claim logic
# TODO: burn logic