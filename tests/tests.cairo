use raito::validation::target_to_bits;

#[test]
fn test_target_to_bits_large_target() {
    let target: u256 = 0x1bc330000000000000000000000000000000000000000000;
    let result = target_to_bits(target).unwrap();
    assert!(result == 0x181bc330, "Incorrect bits for large target");
}

#[test]
fn test_target_to_bits_small_target() {
    let target: u256 = 0x92340000;
    let result = target_to_bits(target).unwrap();
    assert!(result == 0x05009234, "Incorrect bits for small target");
}

#[test]
fn test_target_to_bits_medium_target() {
    let target: u256 = 0x12345600;
    let result = target_to_bits(target).unwrap();
    assert!(result == 0x04123456, "Incorrect bits for medium target");
}

#[test]
fn test_target_to_bits_max_target() {
    let max_target: u256 = 0x00000000ffff0000000000000000000000000000000000000000000000000000;
    let result = target_to_bits(max_target).unwrap();
    assert!(result == 0x1d00ffff, "Incorrect bits for max target");
}

#[test]
fn test_target_to_bits_high_precision_target() {
    let target: u256 = 0x000000000d314200000000000000000000000000000000000000000000000000;
    let result = target_to_bits(target).unwrap();
    assert!(result == 0x1c0d3142, "Incorrect bits for high precision target");
}

#[test]
fn test_target_to_bits_low_precision_target() {
    let target: u256 = 0x00000000000000000007a4290000000000000000000000000000000000000000;
    let result = target_to_bits(target).unwrap();
    assert!(result == 0x1707a429, "Incorrect bits for low precision target");
}

#[test]
fn test_target_to_bits_full_mantissa() {
    let target: u256 = 0xd86a528bc8bc8bc8bc8bc8bc8bc8bc8bc8bc8bc8bc8bc8bc8bc8bc8b;
    let result = target_to_bits(target).unwrap();
    assert!(result == 0x1d00d86a, "Incorrect bits for full mantissa target");
}

#[test]
fn test_target_to_bits_zero_target() {
    let result = target_to_bits(0.into());
    assert!(result.is_err(), "Should error on zero target");
}

#[test]
fn test_target_to_bits_overflow_target() {
    let target: u256 = 0x01000000000000000000000000000000000000000000000000000000000000000;
    let result = target_to_bits(target);
    assert!(result.is_err(), "Should error on overflow target");
}
