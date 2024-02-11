# pragma version ^0.3.10

packed_ref_reserves: uint256
packed_main_reserves: uint256

@internal
@pure
def unpack_ref_reserves(packed_reserves: uint256) -> uint256[3]:
    """
    last_block_timestamp, x_ref, y_ref
    """
    return [
        packed_reserves >> 224,
        (packed_reserves << 32) >> 224,
        (packed_reserves << 144) >> 144
    ]

@internal
@pure
def unpack_main_reserves(packed_reserves: uint256) -> uint256[4]:
    """
    x_to_y_fee, y_to_x_fee, x_main, y_main
    """
    return [
        packed_reserves >> 240,
        (packed_reserves << 16) >> 240,
        (packed_reserves << 32) >> 224,
        (packed_reserves << 144) >> 144
    ]

@internal
def update_fee_rate():
    pass