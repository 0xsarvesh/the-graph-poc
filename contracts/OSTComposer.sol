pragma solidity ^0.5.0;


contract OSTComposer {

    bytes32 constant public STAKEREQUEST_INTENT_TYPEHASH = keccak256(
        abi.encode(
            "StakeRequest(uint256 amount,address beneficiary,uint256 gasPrice,uint256 gasLimit,uint256 nonce,address staker,address gateway)"
        )
    );

    event StakeRequested(
        uint256 amount,
        address beneficiary,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        address indexed staker,
        address gateway,
        bytes32 stakeRequestHash
    );

    function requestStake(
        uint256 _amount,
        address _beneficiary,
        uint256 _gasPrice,
        uint256 _gasLimit,
        uint256 _nonce,
        address _gateway
    )
    external
    returns (bytes32 stakeRequestHash_)
    {


        stakeRequestHash_ = hashStakeRequest(
            _amount,
            _beneficiary,
            _gasPrice,
            _gasLimit,
            _nonce,
            msg.sender,
            address(_gateway)
        );
        emit StakeRequested(
            _amount,
            _beneficiary,
            _gasPrice,
            _gasLimit,
            _nonce,
            msg.sender,
            address(_gateway),
            stakeRequestHash_
        );
    }

    function hashStakeRequest(
        uint256 _amount,
        address _beneficiary,
        uint256 _gasPrice,
        uint256 _gasLimit,
        uint256 _nonce,
        address _staker,
        address _gateway
    )
    private
    pure
    returns (bytes32 stakeRequestIntentHash_)
    {
        stakeRequestIntentHash_ = keccak256(
            abi.encodePacked(
                STAKEREQUEST_INTENT_TYPEHASH,
                _amount,
                _beneficiary,
                _gasPrice,
                _gasLimit,
                _nonce,
                _staker,
                _gateway
            ));
    }
}
