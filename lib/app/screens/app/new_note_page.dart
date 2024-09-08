part of 'home.dart';

class NewNotePage extends StatelessWidget {
  NewNotePage({super.key});

  final TextEditingController _titleController = TextEditingController();

  _onToDoPressed(BuildContext context) {
    var todoBlock = ToDoBlock(name: _titleController.text);
    print('SEND: create new block');
    BlocProvider.of<WrittenControllerBloc>(context).add(CreateToDoBlockEvent(todoBlock: todoBlock));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              const Text('New written'),
              const SizedBox(height:10),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'title of new written'
                ),
              ),
              const SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.note_add_rounded),
                      ElevatedButton(
                        onPressed: (){},
                          child: const Text(
                            'Note',
                          ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.add_task_rounded),
                      ElevatedButton(
                        onPressed: (){_onToDoPressed(context);},
                        child: const Text(
                          'ToDo',
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}