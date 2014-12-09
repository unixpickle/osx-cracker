# I'm not working on this

After realizing how much of a pointless effort this project is, I am not going to continue working on it. :(

# Password Recovery Tools

When this is completed, it will consist of two separate tools. The first tool will make it easy to extract password hashes from Mac OS X. The second tool will crack these hashes using brute force or dictionary search.

This is intended to be used only **to recover lost or forgotten passwords**. It will require administrator privileges on the target machine.

# Language Choices

For the hash extractor tool, I will use **Objective-C**. Since this program will always be run directly on a Mac, this language choice is appropriate.

I plan to use **Go** for the hash cracker itself. Go provides a strong threading mechanism that will make it easy to distribute the brute force search. Additionally, Go is cross-platform, so the cracker will not need to run on a Mac.

# TODO

 * Extract password hashes from user property-lists.
 * Create IPC bridging mechanism for privileged daemon
 * Create GUI for listing users and finding their hashes.
