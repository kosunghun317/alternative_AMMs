# pragma version ^0.3.10

from vyper.interfaces import ERC20
from vyper.interfaces import ERC20Detailed

########################################
#           Fugazi LP Storage          #
########################################

vault: public(address)
tokenX: public(address)
tokenY: public(address)

@external
def initialize(_tokenX: address, _tokenY: address):
    self.vault = msg.sender
    self.tokenX = _tokenX
    self.tokenY = _tokenY

    self.name = "Fugazi LP"
    self.symbol = "FGZ-LP"
    self.decimals = 18

    # TODO: mint initial LP tokens

########################################
#             ERC20 Storage            #
########################################

implements: ERC20
implements: ERC20Detailed

name: public(String[32])

symbol: public(String[32])

decimals: public(uint8)

balanceOf: public(HashMap[address, uint256])

allowance: public(HashMap[address, HashMap[address, uint256]])

totalSupply: public(uint256)

########################################
#             ERC20 Events             #
########################################

event Transfer:
    owner: indexed(address)
    to: indexed(address)
    amount: uint256

event Approval:
    owner: indexed(address)
    spender: indexed(address)
    amount: uint256

########################################
#            ERC20 Functions           #
########################################

@external
def transfer(_to : address, amount : uint256) -> bool:
    """
    @dev Transfers `amount` tokens from msg.sender to `_to`.
    @param _to The address of the recipient.
    @param amount The amount of tokens to be transferred.
    """
    self.balanceOf[msg.sender] -= amount
    self.balanceOf[_to] += amount
    log Transfer(msg.sender, _to, amount)
    return True

@external
def transferFrom(_from : address, _to : address, amount : uint256) -> bool:
    """
    @dev Transfers `amount` tokens from `_from` to `_to`.
    @param _from The address of the sender.
    @param _to The address of the recipient.
    @param amount The amount of tokens to be transferred.
    """
    self.balanceOf[_from] -= amount
    self.balanceOf[_to] += amount
    self.allowance[_from][msg.sender] -= amount
    log Transfer(_from, _to, amount)
    return True

@external
def approve(spender : address, amount : uint256) -> bool:
    """
    @dev Increases the amount of tokens that the spender is able to spend on behalf of msg.sender.
    @param spender The address of the spender.
    @param amount The amount of tokens to be approved for spending.
    """
    self.allowance[msg.sender][spender] = amount
    log Approval(msg.sender, spender, amount)
    return True