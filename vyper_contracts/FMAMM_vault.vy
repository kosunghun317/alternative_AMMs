# pragma version ^0.3.10

from vyper.interfaces import ERC20

########################################
#              Fund Logic              #
########################################

fund: HashMap[address, HashMap[address, uint256]]  # owner -> token -> balance

event Deposit:
    owner: address
    token: address
    amount: uint256

event Withdraw:
    owner: address
    token: address
    amount: uint256

@external
def deposit(token: address, amount: uint256):
    assert ERC20(token).transferFrom(msg.sender, self, amount, default_return_value=True)
    self.fund[msg.sender][token] += amount
    
    log Deposit(msg.sender, token, amount)


@external
def withdraw(token: address, amount: uint256):
    self.fund[msg.sender][token] -= amount
    assert ERC20(token).transfer(msg.sender, amount, default_return_value=True)
    
    log Withdraw(msg.sender, token, amount)

########################################
#         Pool Creation & Infos        #
########################################

pool_template: address

pools: HashMap[bytes32, address]  # pair -> pool

# TODO: complete create_pool logic
@external
def create_pool(_tokenX: address, _tokenY: address):
    # we do not support the native token
    assert convert(_tokenX, uint256) < convert(_tokenY, uint256) and _tokenX != empty(
        address
    )
    pool_id: bytes32 = keccak256(_abi_encode(_tokenX, _tokenY))
    self.pools[pool_id] = create_copy_of(self.pool_template, salt=pool_id)
    # TODO: initialize pool contract
    # TODO: record the pool info
    # TODO: add liquidity to pool


# TODO: submit_order logic
# TODO: settle_batch logic
# TODO: claim logic
# TODO: burn logic

########################################
#              Constructor             #
########################################

@external
def __init__(_pool_template: address):
    self.pool_template = _pool_template
    # TODO: add more configurations