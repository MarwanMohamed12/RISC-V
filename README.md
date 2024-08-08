This project builds upon a single-cycle RISC-V processor by integrating a direct-mapped cache system, designed to enhance data memory access and overall CPU performance. The cache system, dedicated solely to data memory, employs a straightforward design with the following key features:
Only data memory will be cached. The instruction memory will not be affected.
Main memory access (for read or write) takes 4 clock cycles
We will have only one level of cachin
Main memory:  capacity of 4 Kbytes
Direct-Mapped Cache: 512 bytes of cache, divided into 32 blocks of 16 bytes each.
Efficient Memory Access: Reduces latency by handling data reads and writes with optimized hit/miss policies.
Write-Through and Write-Around Policies: Ensures data consistency while managing processor stalls during memory operations.
Finite State Machine Cache Controller: Manages the cache operations and processor stall signals, ensuring smooth integration with the RISC-V core.
This project serves as a practical demonstration of how caching can significantly reduce memory access times and improve the performance of a basic single-cycle processor.
