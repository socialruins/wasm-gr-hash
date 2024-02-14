#include "gr.h"
#include "hash.h"
#include "uint256.h"
#include "utilstrencodings.h"

template <typename T1>
inline uint256 gr_hash(const T1 pbegin, const T1 pend, const uint256 PrevBlockHash)
{
    return HashGR(BEGIN(pbegin), END(pend), PrevBlockHash);
}

