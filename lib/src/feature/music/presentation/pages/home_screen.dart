import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../injection_container.dart';
import '../bloc/service_bloc.dart';
import '../bloc/service_event.dart';
import '../bloc/service_state.dart';
import '../widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ServiceBloc>()..add(LoadServicesEvent()),
      child: Scaffold(
        backgroundColor: Color(0xff18171C),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 50, 16, 32),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFA90140),
                        Color(0xFF550120),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search,
                                    color: Colors.white),
                                suffixIcon:
                                    const Icon(Icons.mic, color: Colors.white),
                                hintText: 'Search “Punjabi Lyrics"',
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: const Color(0xff2F2F39),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child:
                                Icon(Icons.person_outline, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Claim your",
                        style: GoogleFonts.syne(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        'Free Demo',
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "for custom Music Production",
                        style: GoogleFonts.syne(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          "Book Now",
                          style: GoogleFonts.syne(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/record.png',
                    width: 100,
                    scale: 0.2,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/piano.png',
                    width: 120,
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hire hand-picked Pros for popular music services",
              style: GoogleFonts.syne(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  if (state is ServiceLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ServiceLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: state.services.length,
                      itemBuilder: (context, index) {
                        final service = state.services[index];
                        return ServiceCard(service: service);
                      },
                    );
                  } else if (state is ServiceError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              // ✅ Keep all labels visible
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w400),
              currentIndex: 0,
              onTap: (index) {
                // Handle tab switching here
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/home.png',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/news.png',
                    width: 24,
                    height: 24,
                  ),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/track_box.png',
                    width: 24,
                    height: 24,
                  ),
                  label: 'TrackBox',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/projects.png',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Projects',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
